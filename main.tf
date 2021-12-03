provider "google" {
    project = "airline1-sabre-wolverine"
    access_token = var.access_token
    
}

resource "google_sql_database_instance" "master" {
  name             = "us-dev-abcd-fghi-postgres-master1"
  database_version = "POSTGRES_11"
  region           = "us-central1"
  deletion_protection = false
  encryption_key_name = ""

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}


data "google_kms_crypto_key" "crypto_key5" {
  name = "us-dev-abcd-fghi-cryptokey5"
  key_ring = data.google_kms_key_ring.key_ring.id
  }

data "google_kms_key_ring" "key_ring" {
  name     = "us-dev-abcd-fghi-keyring3"
  location = "us"
}

