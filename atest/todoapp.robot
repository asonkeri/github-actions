*** Settings ***
Library           Browser

*** Variables ***
${SUT URL}        https://todomvc.com/examples/vanillajs/
${Todo Input}     .new-todo
${Todo List}      .todo-list

*** Test Cases ***
Should add TODOs
    Given There Are 0 TODOs
    When "Buy Milk" TODO Is Created
    Then There Should Be 1 TODOs
    And "Buy Milk" TODO Should Be In TODO List

Should Delete TODOs
    Given There Are 2 TODOs
    When Latest TODO Is Deleted
    Then There Should Be 1 TODOs

*** Keywords ***
There Are ${num} TODOs
    New Page    ${SUT URL}
    FOR    ${index}    IN RANGE    ${num}
        "Todo-${index}" TODO Is Created
    END

"${todo}" TODO Is Created
    Type Text    ${Todo Input}    ${todo}    clear=True
    Keyboard Key    press    Enter

"${todo}" TODO Should Be In TODO List
    Wait For Elements State    ${Todo List} >> "Buy Milk"    visible

Latest TODO Is Deleted
    ${todo}    Get Element    ${Todo List} li:last-child
    Hover    ${todo}
    Click    ${todo} >> div button
    
There Should Be ${num} TODOs
    ${todos}    Get Elements    ${Todo List} li
    Length Should Be    ${todos}    ${num}
    