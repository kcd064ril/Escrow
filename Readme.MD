
**TodoList Smart Contract README**

### Overview

The TodoList smart contract allows users to manage tasks on the Ethereum blockchain. It provides functions to create tasks, mark them as completed, and retrieve task details.

### Functions

1.  **createTask**
    
    -   Description: Create a new task with a title and description.
    -   Usage: Provide a non-empty title and description to create a task.
    -   Error Handling: Ensure the title is not empty. If it is, the transaction is reverted.
2.  **completeTask**
    
    -   Description: Mark a task as completed by its ID.
    -   Usage: Input the ID of the task to be completed.
    -   Error Handling: Check if the task ID is valid and if the task is already completed. Revert the transaction if conditions are not met.
3.  **getTaskById**
    
    -   Description: Retrieve task details by its ID.
    -   Usage: Input the ID of the task to get its details.
    -   Error Handling: Ensure the task ID exists. Revert the transaction if it does not.
4.  **getTaskCount**
    
    -   Description: Get the total number of tasks stored in the contract.
    -   Usage: Retrieve the count of tasks stored.

### Note

-   Input valid data to avoid transaction failures.
-   The title of a task must not exceed 50 characters.
