import xml.etree.ElementTree as ET
import smtplib
import os
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
from email.MIMEBase import MIMEBase
from email.MIMEImage import MIMEImage
from email.mime.application import MIMEApplication
from email import encoders
import email
import zipfile

#TestCAse status

def send_Email():
    print os.getcwd()
    print dir
  
    to="vhsanathra@gmail.com"
    cc="vhsanathra@gmail.com"
    msg = MIMEMultipart()
    msg['From'] = 'vhsanathra@gmail.com'
    msg['To'] =to
    msg['Cc']=cc
    #To =["Vaibhavi_Sanathra@spe.sony.com"]
    ToAdd=cc.split(",") + [to]
    
    filename='log.html'
    #fo=open('C:\\Users\\vsanathra\\Downloads\\ROBOT\\RIDEProjects\\Corp-SAPBO-Tomcat-RF\\reports\\log.html','rb')
 

    print dir
    file_path=dir+"\\site.zip"
    f='site.zip'
    attachmentZip = MIMEApplication(open(file_path, "rb").read(), _subtype="zip")
    attachmentZip.add_header('Content-Disposition','attachment', filename=f)

    msg.attach(attachmentZip)

    msg.attach(attach)
    
    try:
        server = smtplib.SMTP('smtp.gmail.com',587)
        server.sendmail('vhsanathra@gmail.com',ToAdd, msg.as_string())
        server.quit()
    except:
        print('Cannot send email.')
 
send_Email()


