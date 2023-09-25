curl -X PATCH http://localhost:3000/deliveries/2 \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-d '{ "is_complete": true }'