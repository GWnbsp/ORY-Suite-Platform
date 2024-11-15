set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE "ory-kratos";
    CREATE DATABASE "ory-hydra";
    CREATE DATABASE "ory-keto";
    
    \c "ory-kratos"
    CREATE EXTENSION IF NOT EXISTS pgcrypto;
    
    \c "ory-hydra"
    CREATE EXTENSION IF NOT EXISTS pgcrypto;
    
    \c "ory-keto"
    CREATE EXTENSION IF NOT EXISTS pgcrypto;
EOSQL