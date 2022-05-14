//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;
contract Todo{
    address owner;
    /*
    Create struct called task 
    The struct has 3 fields : id,title,Completed
    Choose the appropriate variable type for each field.

    */

    struct task{
        uint id;
        string title;
        bool Completed;
    }
  
    ///Create a counter to keep track of added tasks
    uint taskCount;

    /*
    create a mapping that maps the counter created above with the struct taskcount
    key should of type integer
    */
    mapping(uint=>task) tasks;
   
    /*
    Define a constructor
    the constructor takes no arguments
    Set the owner to the creator of the contract
    Set the counter to  zero
    */
    constructor(){
        owner=msg.sender;
        taskCount=0;
    }
    
    /*

    Define 2 events
    taskadded should provide information about the title of the task and the id of the task
    taskcompleted should provide information about task status and the id of the task
    */ 
    event taskadded(string title,uint id);
    event taskcompleted(bool taskStatus,uint id);
    
 /*
        Create a modifier that throws an error if the msg.sender is not the owner.
    */
    modifier isOwner(){require(msg.sender==owner);_;}
    

    /*
    Define a function called addTask()
    This function allows anyone to add task
    This function takes one argument , title of the task
    Be sure to check :
    taskadded event is emitted
     */
     function addTask(string memory title)public{
         tasks[taskCount].title=title;
         tasks[taskCount].Completed=false;
         tasks[taskCount].id=taskCount;
         emit taskadded(title,taskCount);
         taskCount=taskCount+1;

     }

    

    /*Define a function  to get total number of task added in this contract*/
    function gettotaltasks()public view returns(uint){
        return taskCount;
    }
    

    /**
    Define a function gettask()
    This function takes 1 argument ,task id and 
    returns the task name ,task id and status of the task
     */

    function gettask(uint id)public view returns(string memory,uint,bool){
        return  (tasks[id].title,tasks[id].id,tasks[id].Completed);
    }
    
    /**Define a function marktaskcompleted()
    This function takes 1 argument , task id and 
    set the status of the task to completed 
    Be sure to check:
    taskcompleted event is emitted
     */
     function marktaskcompleted(uint id)public{
         
         tasks[id].Completed=true;
         emit taskcompleted(tasks[id].Completed,id);
     }
    
}