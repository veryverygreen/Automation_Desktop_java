*** Settings ***
Library  RemoteSwingLibrary

*** Test Cases ***
Запуск приложения
    Start Application    app1    path_to_javacpl.exe    10 seconds
    Select Window  Java Control Panel
Получение данные из раздела Network settings
    ${textFieldValue}=	Get Textfield Value	 1
    #Log To Console  Text: ${textFieldValue} #не работает в pytest, но работает в robot
    Should Be Equal	 Network settings are used when making Internet connections. By default, Java will use the network settings in your web browser. Only advanced users should modify these settings.  ${textFieldValue}
Переключение вкладок
    Select Tab  Security
Переключение чек-боксов
    Uncheck Check Box  Enable Java content in the browser
Нажатие кнопок и выход их дерева
    Check Check Box  Enable Java content in the browser
    Push Button  Edit Site List...
    Select Dialog  Exception Site List
    Push Button  Cancel
Получение данные из комбо-бокса
    Select Window  Java Control Panel
    Select Tab  Security
    Push Button  Manage Certificates...
    Select Dialog  Certificates
    Select From Combo Box  0  Signer CA
Выход из приложения
    Select From Combo Box  0  0
    Push Button  Close
    Select Window  Java Control Panel
    Run Keyword And Ignore Error  Close Window  Java Control Panel

