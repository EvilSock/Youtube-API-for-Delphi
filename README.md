# Youtube-API-for-Delphi
A simple way for all my South African IT students to get youtube statistics in delphi.

# About the project:
The project is designed to be used with delphi 2010. 
You need node.js installed. 

#Project setup:
1. The node.js server queries the youtube api.
2. It converts the response to xml so that you can use it with the delphi xml component.
3. To query the server use localhost on port 8080. Example: http://localhost:8080/?search="enter the youtube video id you want to track"
4. The server will respond with xml. 

Implementation in delphi:
The server is developed to work with delphi. To start the server type in the console: node "location of the app.js file." Do not close the console.
1. Make a new delphi forms aplication.
2. Add an xml component.
3. Set the file location property to this http://localhost:8080/?search="enter the youtube video id you want to track". This can be done in code. The xml component will only query the server once the active proeprty is set to true. Review the delphi example provided for more insight.

#Please take note:
In the app.js file look for the 16th line. 
It says api key. You need to get an api key from google. Follow this link to find out how to do that: https://www.slickremix.com/docs/get-api-key-for-youtube/.
Replace 'api key' in the app.js file line 16 with your own api key.

#Known issues:
In the example project the start server button does not work. This is because the command line does not have the right privilages. It cannnot write to the data.xml file because and thus will always return whatever is currently written to the file. You have to launch the server manually from the command line.
Some errors are unhandled so make sure to do error handling in delphi.
