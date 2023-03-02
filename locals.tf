locals {
  zone_mapping = {
    "sql"         = "privatelink.database.windows.net"
    "blob"        = "privatelink.blob.core.windows.net"
    "queue"       = "privatelink.queue.core.windows.net"
    "file"        = "privatelink.file.core.windows.net"
    "table"       = "privatelink.table.core.windows.net"
    "cosmossql"   = "privatelink.documents.azure.com"
    "vault"       = "privatelink.vaultcore.azure.net"
    "eventhub"    = "privatelink.servicebus.windows.net"
    "eventgrid"   = "privatelink.eventgrid.azure.net"
    "redis"       = "privatelink.redis.cache.windows.net"
    "functionapp" = "privatelink.azurewebsites.net"
  }
}