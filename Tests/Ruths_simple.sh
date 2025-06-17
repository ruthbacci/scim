# Ensure server is on port 5000
lsof -i :5000 | grep LISTEN

# If something else is using port 5000, kill it
lsof -t -i :5000 | xargs kill -9

# Start the server
dotnet run --urls "http://localhost:5002"


#Obtain token
curl -X POST http://localhost:5002/api/auth/token \
  -H "Content-Type: application/json" \
  -d '{
    "clientId": "scim_client",
    "clientSecret": "scim_secret",
    "grantType": "client_credentials"
  }'


  #Create a user
curl -X POST http://localhost:5002/scim/v2/Users \
  -H "Authorization: bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InNjaW1fY2xpZW50Iiwicm9sZSI6IlNDSU1DbGllbnQiLCJ0ZW5hbnRfaWQiOiJ0ZW5hbnQxIiwibmJmIjoxNzUwMTgwMjMyLCJleHAiOjE3NTAxODM4MzIsImlhdCI6MTc1MDE4MDIzMiwiaXNzIjoiaHR0cHM6Ly95b3VyLXNjaW0tcHJvdmlkZXIuY29tIiwiYXVkIjoiaHR0cHM6Ly95b3VyLXNjaW0tcHJvdmlkZXIuY29tIn0.Dmt2HoUUzFn201oe33jxY49oKxdhSasjGY8UpdpsEw8" \
  -H "Content-Type: application/json" \
  -d '{
    "userName": "val.poole@scomclub.co,uk",
    "name": {
      "givenName": "Val",
      "familyName": "Poole"
    },
    "emails": [
      {
        "value": "val.poole@scomclub.co,uk",
        "primary": true
      }
    ],
    "active": true
  }'

  curl -X POST http://localhost:5002/scim/v2/Users \
  -H "Authorization: bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InNjaW1fY2xpZW50Iiwicm9sZSI6IlNDSU1DbGllbnQiLCJ0ZW5hbnRfaWQiOiJ0ZW5hbnQxIiwibmJmIjoxNzUwMTgwMjMyLCJleHAiOjE3NTAxODM4MzIsImlhdCI6MTc1MDE4MDIzMiwiaXNzIjoiaHR0cHM6Ly95b3VyLXNjaW0tcHJvdmlkZXIuY29tIiwiYXVkIjoiaHR0cHM6Ly95b3VyLXNjaW0tcHJvdmlkZXIuY29tIn0.Dmt2HoUUzFn201oe33jxY49oKxdhSasjGY8UpdpsEw8" \
  -H "Content-Type: application/json" \
  -d '{
    "userName": "andrew.walker@scomclub.co,uk",
    "name": {
      "givenName": "andrew",
      "familyName": "walker"
    },
    "emails": [
      {
        "value": "andrew.walker@scomclub.co,uk",
        "primary": true
      }
    ],
    "active": true
  }'

curl -X GET http://localhost:5002/scim/v2/Users \
  -H "Authorization: bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InNjaW1fY2xpZW50Iiwicm9sZSI6IlNDSU1DbGllbnQiLCJ0ZW5hbnRfaWQiOiJ0ZW5hbnQxIiwibmJmIjoxNzUwMTgwMjMyLCJleHAiOjE3NTAxODM4MzIsImlhdCI6MTc1MDE4MDIzMiwiaXNzIjoiaHR0cHM6Ly95b3VyLXNjaW0tcHJvdmlkZXIuY29tIiwiYXVkIjoiaHR0cHM6Ly95b3VyLXNjaW0tcHJvdmlkZXIuY29tIn0.Dmt2HoUUzFn201oe33jxY49oKxdhSasjGY8UpdpsEw8"

