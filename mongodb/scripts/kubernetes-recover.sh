echo "Recovering Mongo"
echo $MONGO_REPL_KEY > /etc/mongo/repl.key 
chmod 400 /etc/mongo/repl.key 
rm -f /data/db/mongod.lock
mongod -f /etc/mongo/config/mongod.conf
