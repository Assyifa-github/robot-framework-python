*** Settings ***
Documentation
...     A resource for global

Library           SeleniumLibrary       10          run_on_failure=Capture Page Screenshot
Library           String
Library           BuiltIn
Library           Collections
# Library           HttpLibrary.HTTP
# Library           ConsoleDialogs
# Library           ImapLibrary
Library           DateTime
Library           Process
# Library           SSHLibrary
Library           GmailEmailLibrary
Library           OperatingSystem
Library           DatabaseLibrary
Library           http.client
Library           json


*** Variable ***
#${BROWSER}                              chrome
${BROWSER}                              headlesschrome
${URL}                                  https://account.proton.me/login
${FB URL}                               https://id-id.facebook.com
# ${EMAIL}                                berrycakery@proton.me
# ${PASSWORD}                             SweetMochi777!
${EMAIL}                                yupiland@proton.me
${PASSWORD}                             Qwerty@123