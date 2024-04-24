// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TodoList {
    struct Task {
        string title;
        string description;
        bool completed;
    }

    Task[] public tasks;

    event NewTask(string title, string description);


    function createTask(string memory _title, string memory _description) external {
        // Revert if title is empty
        // if (bytes(_title).length == 0) {
        //     revert("title must is empty");
        // }

        require(bytes(_title).length > 0, "title must not be empty");

        // Assert that the length of the title is less than or equal to 50 characters
        assert(bytes(_title).length <= 50);

        // Ensure title length is not greater than 50 characters
        // require(bytes(_title).length <= 50, "Title must not exceed 50 characters");


        tasks.push(Task(_title, _description, false));
        emit NewTask(_title, _description);
    }

    function completeTask(uint256 _taskId) external {
        // Ensure task exists
        require(_taskId <= tasks.length, "Task does not exist");
        // if (_taskId >= tasks.length) {
        //     revert("Task does not exist");
        // }
        
        Task storage task = tasks[_taskId];
        
        // Ensure task is not already completed
        if (task.completed) {
            revert("Task is already completed");
        }
        
        task.completed = true;
    }

    function getTaskById(uint256 _taskId) external view returns (string memory title, string memory description, bool completed) {
        require(_taskId < tasks.length, "Task does not exist");

        Task storage task = tasks[_taskId];

        return (task.title, task.description, task.completed);
    }

    function getTaskCount() external view returns (uint256) {
        return tasks.length;
    }

    
}


// This is a title longer than fifty characters, which should trigger an assertion error
