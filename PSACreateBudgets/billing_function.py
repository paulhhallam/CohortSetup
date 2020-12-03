import json
import boto3
import uuid
from datetime import date
import os

def billing_handler(event, context):
    Dollars = os.environ['Dollars']
    SNSARN = os.environ['SNSARN']
    startd = str(date.today().replace(day=1))
    today = str(date.today())

    billclient = boto3.client('ce')

    response = billclient.get_cost_and_usage(
        TimePeriod={
            'Start': startd,
            'End': today
        },
        Granularity='MONTHLY',
        Metrics=[
            'AmortizedCost',
        ]
    )
#     MY_SNS_TOPIC_ARN = 'arn:aws:sns:eu-west-2:270848561385:PHHRIO-test1'
#   SNSARN
    sns_client = boto3.client('sns')

#   Send message to SNS if cost > 80% of the environment variable Dollars
    if ( float(response['ResultsByTime'][0]['Total']['AmortizedCost']['Amount'] ) > (float(Dollars) * .8) ):
       sns_client.publish(
           TopicArn = SNSARN,
           Subject = 'PurpleSkyAcademy this months cost is now > 80% of $' + Dollars,
           Message = 'PurpleSkyAcademy this months cost is now $ ' + json.dumps(response['ResultsByTime'][0]['Total']['AmortizedCost']['Amount'])
       )

#   Send warning message to SNS if cost > 50% of the environment variable Dollars
    elif ( float(response['ResultsByTime'][0]['Total']['AmortizedCost']['Amount'] ) > (float(Dollars) * .5) ):
       sns_client.publish(
           TopicArn = SNSARN,
           Subject = 'PurpleSkyAcademy this months cost is now > 50% of $' + Dollars,
           Message = 'PurpleSkyAcademy billing totasl now $ ' + json.dumps(response['ResultsByTime'][0]['Total']['AmortizedCost']['Amount'])
       )
    else:
       sns_client.publish(
           TopicArn = SNSARN,
           Subject = 'INFORMATION ONLY: PurpleSkyAcademy this months cost is now $'  + json.dumps(response['ResultsByTime'][0]['Total']['AmortizedCost']['Amount']),
           Message = 'INFORMATION ONLY: PurpleSkyAcademy this months cost is now $ ' + json.dumps(response['ResultsByTime'][0]['Total']['AmortizedCost']['Amount'])
       )
       