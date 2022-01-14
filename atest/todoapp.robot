*** Settings ***
Library           Browser

*** Variables ***
${SUT URL}        https://todomvc.com/examples/vanillajs/
${Todo Input}     .new-todo
${Todo List}      .todo-list

*** Test Cases ***
Should add TODOs
    Given There Are No TODOs
    When "Buy Milk" TODO Is Created
    Then "Buy Milk" TODO Should Be In TODO List

*** Keywords ***
There Are No TODOs
    New Page    ${SUT URL}

"${todo}" TODO Is Created
    Type Text    ${Todo Input}    ${todo}    clear=True
    Keyboard Key    press    Enter

"${todo}" TODO Should Be In TODO List
    Wait For Elements State    ${Todo List} >> "Buy Milk"    visible
