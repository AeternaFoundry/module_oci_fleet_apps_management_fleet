output "fleet_apps_management_fleets_id" {
  description = "Map of id values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no id are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "fleet_apps_management_fleets_compartment_id" {
  description = "Map of compartment_id values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no compartment_id are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "fleet_apps_management_fleets_credentials" {
  description = "Map of credentials values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no credentials are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.credentials if v.credentials != null && length(v.credentials) > 0 }
}
output "fleet_apps_management_fleets_defined_tags" {
  description = "Map of defined_tags values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no defined_tags are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "fleet_apps_management_fleets_description" {
  description = "Map of description values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no description are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.description if v.description != null && length(v.description) > 0 }
}
output "fleet_apps_management_fleets_details" {
  description = "Map of details values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no details are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => one(v.details) if v.details != null && length(v.details) > 0 }
}
output "fleet_apps_management_fleets_display_name" {
  description = "Map of display_name values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no display_name are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "fleet_apps_management_fleets_environment_type" {
  description = "Map of environment_type values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no environment_type are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.environment_type if v.environment_type != null && length(v.environment_type) > 0 }
}
output "fleet_apps_management_fleets_freeform_tags" {
  description = "Map of freeform_tags values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "fleet_apps_management_fleets_is_target_auto_confirm" {
  description = "Map of is_target_auto_confirm values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no is_target_auto_confirm are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.is_target_auto_confirm if v.is_target_auto_confirm != null }
}
output "fleet_apps_management_fleets_lifecycle_details" {
  description = "Map of lifecycle_details values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "fleet_apps_management_fleets_notification_preferences" {
  description = "Map of notification_preferences values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no notification_preferences are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.notification_preferences if v.notification_preferences != null && length(v.notification_preferences) > 0 }
}
output "fleet_apps_management_fleets_parent_fleet_id" {
  description = "Map of parent_fleet_id values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no parent_fleet_id are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.parent_fleet_id if v.parent_fleet_id != null && length(v.parent_fleet_id) > 0 }
}
output "fleet_apps_management_fleets_products" {
  description = "Map of products values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no products are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.products if v.products != null && length(v.products) > 0 }
}
output "fleet_apps_management_fleets_properties" {
  description = "Map of properties values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no properties are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.properties if v.properties != null && length(v.properties) > 0 }
}
output "fleet_apps_management_fleets_resource_region" {
  description = "Map of resource_region values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no resource_region are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.resource_region if v.resource_region != null && length(v.resource_region) > 0 }
}
output "fleet_apps_management_fleets_resource_selection" {
  description = "Map of resource_selection values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no resource_selection are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => one(v.resource_selection) if v.resource_selection != null && length(v.resource_selection) > 0 }
}
output "fleet_apps_management_fleets_resources" {
  description = "Map of resources values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no resources are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.resources if v.resources != null && length(v.resources) > 0 }
}
output "fleet_apps_management_fleets_state" {
  description = "Map of state values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no state are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.state if v.state != null && length(v.state) > 0 }
}
output "fleet_apps_management_fleets_system_tags" {
  description = "Map of system_tags values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no system_tags are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "fleet_apps_management_fleets_time_created" {
  description = "Map of time_created values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no time_created are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "fleet_apps_management_fleets_time_updated" {
  description = "Map of time_updated values across all fleet_apps_management_fleets, keyed the same as var.fleet_apps_management_fleets except keys with no time_updated are omitted"
  value       = { for k, v in oci_fleet_apps_management_fleet.fleet_apps_management_fleets : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}

