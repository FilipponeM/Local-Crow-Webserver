//Matteo Filippone
//main.cpp
//Lab 10
//April 14

#define CROWMAIN

#include "crow_all.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <ostream>


using namespace std;
using namespace crow;

void sendFile(response& res, string filename, string contentType)
{
	ifstream in("../public/" + filename, ifstream::in);
	if (in)
	{
		ostringstream contents;
		contents << in.rdbuf();
		in.close();
		res.set_header("Content-Type", contentType);
		res.write(contents.str());
	}
	else
	{
		res.code = 404;
		res.write("Not Found");
	}
	res.end();
}

void sendHtml(response& res, string filename)
{
	sendFile(res, filename + ".html", "text/html");
}

void sendImage(response& res, string filename)
{

	sendFile(res, "images/" + filename, "image/jpg");
}

void sendScript(response& res, string filename)
{
	sendFile(res, "scripts/" + filename, "text/javascript");
}

void sendStyle(response& res, string filename)
{
	sendFile(res, "styles/" + filename, "text/css");
}

int main()
{

	bool loggedIn = false;
	crow::SimpleApp app;

	//route for quaries to check the log in password and username
	CROW_ROUTE(app, "/signin").methods(HTTPMethod::Post, HTTPMethod::Get)
	([&loggedIn](const request& req, response& res) -> void {

	ostringstream contents;
	//read the queries from the rest route
	string user = req.url_params.get("user");
	string pass = req.url_params.get("pass");

	if ((user == "username") && (pass == "password")){

		//if correct log in set loggedin to true throw 200 and reload page
		loggedIn = true;
		res.code = 202; 
		
		contents << "Logged in";
		res.write(contents.str());
		sendHtml(res, "/CheckOut");

		res.end();
	}
	else{

		//if failed ot log in throw 401 and reload page
		res.code = 401; 
		
		contents << "Failed to log in, try again";
		res.write(contents.str());
		sendHtml(res, "/CheckOut");

		res.end();
	}

	});

	//Route to check for /CheckOut to make sure that the 402 can work
	CROW_ROUTE(app, "/CheckOut")
		([&loggedIn](const request& req, response& res){

		ostringstream os;
		
		if (loggedIn == true){

			// when logged in allow for the user to pay for th items and shows they are logged in
			res.code = 200;
			os << "Logged in"<< std::endl;
			res.write(os.str());
			sendHtml(res, "/CheckOut");
			res.end();
		}
		else{
			//when they load checkout if not logged in throw 402 and ask to log in
			res.code = 402;
			os << "Payment Required - Please Login"<< endl;
			res.write(os.str());
			sendHtml(res, "/CheckOut");
			res.end();

		}

		

		});

		//route to read from the file 
		CROW_ROUTE(app, "/get_cart")
		([&loggedIn](const request& req, response& res)
			{
			
			
			//if logged in read file 
			if(loggedIn == true){
				ostringstream os;
				ifstream file("cart.csv");
				if (!file.is_open()) {
					cerr << "Unable to open file" << endl;
					perror("Error opening file"); // Print detailed error message
					res.code = 500; // Internal Server Error
					res.write("Unable to open file");
					res.end();
					return; 
				}

				//write the lines of file into os stream
				string line;
				while (getline(file, line)) {
					os << line + "\n" << endl;// Write each line into the ostringstream
				}
				res.set_header("Content-Type", "text/html");
				res.code = 200;
				res.write(os.str());
				
				
				res.end();

			}
			else{

				//if not logged in send to a "fail page"
				res.set_header("Content-Type", "text/html");
				res.write("Not logged in");
				res.code = 401;
				res.end();
			}
				
		});

	CROW_ROUTE(app, "/")
		([](const request& req, response& res)
			{
				sendHtml(res, "index");
			});

	CROW_ROUTE(app, "/<string>")
		([](const request& req, response& res, string filename)
			{
				sendHtml(res, filename);
			});

	CROW_ROUTE(app, "/get_styles/<string>")
		([](const request& req, response& res, string filename)
			{
				sendStyle(res, filename);
			});

	CROW_ROUTE(app, "/get_scripts/<string>")
		([](const request& req, response& res, string filename)
			{
				sendScript(res, filename);
			});

	CROW_ROUTE(app, "/get_images/<string>")
		([](const request& req, response& res, string filename)
			{
				sendImage(res, filename);
			});


	//route for adding the products to the file
	CROW_ROUTE(app, "/add/<string>/<int>").methods(HTTPMethod::Post)
		([](const request& req, response& res, string product, int num) -> void {
			// Attempt to open the file
			ofstream file("cart.csv", ios::app);
			if (!file.is_open()) {
				cerr << "Unable to open file" << endl;
				perror("Error opening file"); // Print detailed error message
				res.code = 500; // Internal Server Error
				res.write("Unable to open file");
				res.end();
				return; 
			}

			// Convert the quantity to a string
			string nums = to_string(num);

			string result = product + "," + nums + "\n";
			// Write the product and quantity to the file
			file << result;
			
			// Close the file
			file.close();

			res.code = 200; 
			
			res.end();
		});


	app.port(23500).multithreaded().run();


}