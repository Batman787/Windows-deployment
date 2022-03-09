Import-Module ActiveDirectory

$passwd = ConvertTo-SecureString "Admin1!" -AsPlainText -Force

$users = Import-Csv 'C:\Users\Administrator\Desktop\Copy of Initech Staff List.csv'

ForEach ($user in $users) {
    $fname = $user.'First Name'
    $lname = $user.'Last Name'
    $uname = $user.Username
    $title = $user.Title
    $empnumber = $user.'Employee #'
    $ou = $user.OU
    $manager = $user.'Reporting To'
    $homedir = \\WIN-JJ7Q1UCROEN.Intech.net\User_share$\%UserName%


    New-ADUser -Name "$fname $lname" -GivenName $fname -Surname $lname -UserPrincipalName "$fname $lname" -Path $ou -AccountPassword $passwd -ChangePasswordAtLogon $True -Description "$empnumber $title" -Enabled $True -Title $title -EmployeeNumber $empnumber -HomeDrive 'Z:' -HomeDirectory \\WIN-JJ7Q1UCROEN.Intech.net\User_share$\%UserName%

    echo "account created for  $empnumber $fname $lname $uname $title in $ou"
 }
