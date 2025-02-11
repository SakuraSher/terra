resource_group_name = "RG-App"
service_plan_name   = "Plan-App"
environment         = "DEV1"


web_apps = {
  webapp1 = {
    "name"                = "webappdemobookamu1"
    "location"            = "westeurope"
    "serverdatabase_name" = "server1"
  },
  webapp2 = {
    "name"                = "webapptestbookamu2"
    "serverdatabase_name" = "server2"
  }
}