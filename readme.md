# Automation UI and API Test Using Robot Framework

## Description
The project aims to do UI and API tests using Robot Framework for Automation. The UI tests include testing checkout process, items sorting and login validation.
The API tests include different http requests such as GET, POST, PUT and DELETE.


#### Note: For the UI test (Checkout test), only two items were used with the assumption that they are different items.

## Prerequisites
Before running the tests, ensure that you have the following software and tools installed on your machine:

- Python (version 3.14)
- Robot Framework (install using `pip install robotframework`)
- SeleniumLibrary (for UI testing, install using `pip install robotframework-seleniumlibrary`)
- RequestsLibrary (for API testing, install using `pip install robotframework-requests`)
- Google Chrome and the compatible ChromeDriver

## Installation Instructions
1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd SpriteCloudAssignment
2. Install the required packages:
   ```bash
   pip install -r requirements.txt
3. Ensure you have the browser and its driver installed as per the Prerequisites section.

## How to Run Tests
To execute the tests, navigate to the project's root directory and run the following command:

   # Run API tests
        robot --outputdir results/api_result tests/api_tests/
   # Run UI tests
         robot --outputdir results/ui_result tests/ui_tests/

## Test Structure
The test suite is organized as follows:
   # 
   
      SpriteCloudAssignment/
      │
      ├── .venv                   
      ├── keywords/               
      │   ├── api_keywords/
      │   │   └── user_api_keyword.robot
      │   └── ui_keywords/
      │       ├── checkout_keyword.robot
      │       ├── failed_login_keyword.robot
      │       └── sort_items_keyword.robot
      │
      ├── resources/              
      │   ├── data/
      │   │   ├── login_request.json
      │   │   └── update_request.json
      │   └── variables/
      │       ├── api_variables.robot
      │       └── ui_variables/
      │           ├── order_process_locators.robot
      │           └── order_process_variables.robot
      │
      ├── results/                
      │   ├── api_result/
      │   │   ├── log.html
      │   │   ├── output.xml
      │   │   └── report.html
      │   └── ui_result/
      │       ├── log.html
      │       ├── output.xml
      │       └── report.html
      │
      └── tests/                  
          ├── api_tests/
          │   └── user_api_tests.robot
          └── ui_tests/
              ├── checkout_tests.robot
              ├── failed_login_tests.robot
              └── sort_items_tests.robot
## Outputs
You will find the results in the results/ directory, including logs, an output XML file, and an HTML report for each test suite.