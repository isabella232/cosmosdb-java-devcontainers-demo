echo "adding certificate..."

add_cert() {
    curl -k https://cosmosdb:8081/_explorer/emulator.pem > ~/emulatorcert.crt && keytool -noprompt -storepass changeit -keypass changeit -keystore /docker-java-home/lib/security/cacerts -importcert -alias emulator_cert -file ~/emulatorcert.crt
}

until add_cert >> /dev/null 2>&1 
do
  sleep 2s
  echo "retrying.."
done

echo "added certificate successfully"