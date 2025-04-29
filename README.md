NFC based ADA Application

Description
This is the back end application developed using Laravel for an NFC application. This application supports room booking, NFC card scanning for entry, and tracking of room usage on an admin dashboard. The system makes use of several Laravel features, such as Sanctum for token-based authentication, Guzzle for API-based interaction, and Redis for caching.

Table of Contents
1. Installation
2. Configuration
3. Usage
4. Testing
5. Deployment
6. Directory Structure
7. API Endpoints
8. Running API Endpoints with Postman
9. Hosting
10. Contact Information

Installation
Make sure that you have to following software installed-
1. PHP 8.1 or newer
2. Composer
3. MySQL or any relational database
4. Redis (for caching)
5. Laravel version 10.x

Clone the repository and install the required dependencies-
git clone <your-repository-url>
cd <your-project-directory>
composer install

Configuration
1. Copy the .env.example file to .env:  
cp .env.example .env

2. Generate the application key-
php artisan key:generate

3. Database configuration- update the .env file with your database connection details:
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database_name
DB_USERNAME=your_username
DB_PASSWORD=your_password

4. Sanctum configuration- (for token-based authentication)(make sure that SANCTUM_STATEFUL_DOMAINS variable is set in .env file)-
SANCTUM_STATEFUL_DOMAINS=task.bazarlook.com

5. Migrate the database- run the migrations to set up your database:
php artisan migrate

6. Additional- ensure that Redis is set up in your environment.

Usage
To run the Laravel app locally, use the built-in PHP server-
php artisan serve

Testing
Run the tests using PHPUnit-
php artisan test

Deployment
1. Make sure you have web server (e.g., Nginx or Apache) set up for handling the requests to Laravel app. 
2. Set your environment variables in .env file
3. Run the following commands-
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan migrate --force
4. Make sure to configure the correct permission for your storage and bootstrap/cache directories-
chmod -R 775 storage bootstrap/cache

Docker Setup
If you are using docker, build and run-
docker-compose up -d

Directory Structure
Overview of project's directory structure-
├── app/               # Application logic (Controllers, Models, etc.)
├── bootstrap/         # Framework bootstrap files
├── config/            # Configuration files
├── database/          # Migrations, Seeders
├── public/            # Publicly accessible files (entry point, assets)
├── resources/         # Views, translations, assets (CSS, JS)
├── routes/            # All route definitions (web.php, api.php)
├── storage/           # File storage (logs, cache, etc.)
├── tests/             # Unit and feature tests
└── .env               # Environment settings

API Endpoints
Authentication & Token Management
Login: POST /login_app

Issues a Sanctum bearer token after validating the user’s email/password.

User-Facing Workflow
Get my profile: GET /user
List buildings: GET /getAllBuildings
List rooms: GET /rooms (or by building GET /getAllRoomsByBuildingId/{building_id})

NFC Access
Validate UID: GET /validateUid/{uid}/{accessPointId}

Room Reservation
Reserve a room: POST /reserveRoom

Fields: room_id, start_time, end_time, room_inventory?, participant_number?, description?, event_type?

Audit & Reporting
Who’s entered my room: GET /whoEnteredMyRoom?from_date=…&to_date=…
Reservation logs: GET /getAllReservationLogs?buildingID=&roomID=&userID=&start_date=&end_date=

Running API Endpoints with Postman
1. Download and install Postman- https://www.postman.com/downloads/
2. Import the Postman collection. You can manually create API request in Postman also.

Login and Authentication
1. Login to get the API token
2. Request:
Method: POST
URL: http://localhost:8000/login_app
Body (JSON):
{
  "email": "user@example.com",
  "password": "yourpassword"
}

3. Store the token:
On success, you will receive a response containing the token:
{
  "token": "your_generated_sanctum_token",
  "user_data": {
    "id": 1,
    "name": "John Doe",
    "email": "user@example.com",
    "uid": "1234567890"
  }
}

4. Make Authenticated Requests
For all subsequent requests, you need to pass the Authorization Token in the Authorization header as a Bearer token.
Authorization Tab in Postman:
Type: Bearer Token
Token: Paste the token you received during login.

Get User Profile:
Request:
Method: GET
URL: http://localhost:8000/user
Headers: Add Authorization: Bearer <your_token> in the headers.

List Buildings:
Request:
Method: GET
URL: http://localhost:8000/getAllBuildings

Reserve a Room:
Request:
Method: POST
URL: http://localhost:8000/reserveRoom
Body (JSON):
{
  "room_id": 1,
  "start_time": "2025-05-01 09:00",
  "end_time": "2025-05-01 11:00",
  "event_type": "Meeting"
}

NFC Access Validation:
Request:
Method: GET
URL: http://localhost:8000/validateUid/{uid}/{accessPointId}
Replace {uid} and {accessPointId} with appropriate values.

Reservation Logs:
Request:
Method: GET
URL: http://localhost:8000/getAllReservationLogs?buildingID=&roomID=&userID=&start_date=&end_date=

Hosting
The website has been successfully deployed and is now hosted on Hostinger. You can access the application at the following URL:
task.bazarlook.com

Contact Information
For any inquiries or issues, feel free to contact:
Name: Fidan Mardanli
Email: fmardanli11230@ada.edu.az
GitHub: https://github.com/fidanmardanli
