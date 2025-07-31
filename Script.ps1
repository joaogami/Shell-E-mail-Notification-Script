#Email Configuration, in this case its an Gmail
$from = "sender@gmail.com"
$to = @("email1@gmail.com", "email2@gmail.com", "email32@gmail.com")
$subject = "Subject of your email notification - $(Get-Date -Format yyyy-MM-dd)"
$body = "There is your notification of windows shell of the day $(Get-Date -Format dd/MM/yyyy)."

# if you need attachments this is the field to catch them !
$attachments = @("C:\Users\YourName\Desktop\LogOfSomething.log", "C:\Users\YourName\Desktop\Document.doc")

# Gmail credentials
$password = ConvertTo-SecureString "yourgmailapplicationkey" -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential("sender@gmail.com", $password)

# sending using Gmail
Send-MailMessage -From $from `
                 -To $to `
                 -Subject $subject `
                 -Body $body `
                 -SmtpServer "smtp.gmail.com" `
                 -Port 587 `
                 -UseSsl `
                 -Credential $credential `
                 -Attachments $attachments
