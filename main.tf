resource "oci_fleet_apps_management_fleet" "fleet_apps_management_fleets" {
  for_each = var.fleet_apps_management_fleets

  compartment_id         = each.value.compartment_id
  display_name           = each.value.display_name
  defined_tags           = each.value.defined_tags
  description            = each.value.description
  environment_type       = each.value.environment_type
  freeform_tags          = each.value.freeform_tags
  is_target_auto_confirm = each.value.is_target_auto_confirm
  parent_fleet_id        = each.value.parent_fleet_id
  products               = each.value.products

  resource_selection {
    resource_selection_type = each.value.resource_selection.resource_selection_type
    dynamic "rule_selection_criteria" {
      for_each = each.value.resource_selection.rule_selection_criteria != null ? [each.value.resource_selection.rule_selection_criteria] : []
      content {
        match_condition = rule_selection_criteria.value.match_condition
        dynamic "rules" {
          for_each = rule_selection_criteria.value.rules != null ? rule_selection_criteria.value.rules : []
          content {
            basis                     = rules.value.basis
            compartment_id            = rules.value.compartment_id
            compartment_id_in_subtree = rules.value.compartment_id_in_subtree
            dynamic "conditions" {
              for_each = rules.value.conditions != null ? rules.value.conditions : []
              content {
                attr_group = conditions.value.attr_group
                attr_key   = conditions.value.attr_key
                attr_value = conditions.value.attr_value
              }
            }
            match_condition         = rules.value.match_condition
            resource_compartment_id = rules.value.resource_compartment_id
          }
        }
      }
    }
  }

  dynamic "credentials" {
    for_each = each.value.credentials != null ? each.value.credentials : []
    content {
      compartment_id = credentials.value.compartment_id
      display_name   = credentials.value.display_name
      entity_specifics {
        credential_level = credentials.value.entity_specifics.credential_level
        resource_id      = credentials.value.entity_specifics.resource_id
        target           = credentials.value.entity_specifics.target
        dynamic "variables" {
          for_each = credentials.value.entity_specifics.variables != null ? credentials.value.entity_specifics.variables : []
          content {
            name  = variables.value.name
            value = variables.value.value
          }
        }
      }
      password {
        credential_type = credentials.value.password.credential_type
        key_id          = credentials.value.password.key_id
        key_version     = credentials.value.password.key_version
        secret_id       = credentials.value.password.secret_id
        secret_version  = credentials.value.password.secret_version
        value           = credentials.value.password.value
        vault_id        = credentials.value.password.vault_id
      }
      user {
        credential_type = credentials.value.user.credential_type
        key_id          = credentials.value.user.key_id
        key_version     = credentials.value.user.key_version
        secret_id       = credentials.value.user.secret_id
        secret_version  = credentials.value.user.secret_version
        value           = credentials.value.user.value
        vault_id        = credentials.value.user.vault_id
      }
    }
  }

  dynamic "details" {
    for_each = each.value.details != null ? [each.value.details] : []
    content {
      fleet_type = details.value.fleet_type
    }
  }

  dynamic "notification_preferences" {
    for_each = each.value.notification_preferences != null ? each.value.notification_preferences : []
    content {
      compartment_id = notification_preferences.value.compartment_id
      dynamic "preferences" {
        for_each = notification_preferences.value.preferences != null ? [notification_preferences.value.preferences] : []
        content {
          on_job_canceled            = preferences.value.on_job_canceled
          on_job_failure             = preferences.value.on_job_failure
          on_job_schedule_change     = preferences.value.on_job_schedule_change
          on_job_start               = preferences.value.on_job_start
          on_job_success             = preferences.value.on_job_success
          on_resource_non_compliance = preferences.value.on_resource_non_compliance
          on_runbook_newer_version   = preferences.value.on_runbook_newer_version
          on_task_failure            = preferences.value.on_task_failure
          on_task_pause              = preferences.value.on_task_pause
          on_task_success            = preferences.value.on_task_success
          on_topology_modification   = preferences.value.on_topology_modification
          dynamic "upcoming_schedule" {
            for_each = preferences.value.upcoming_schedule != null ? [preferences.value.upcoming_schedule] : []
            content {
              notify_before        = upcoming_schedule.value.notify_before
              on_upcoming_schedule = upcoming_schedule.value.on_upcoming_schedule
            }
          }
        }
      }
      topic_id = notification_preferences.value.topic_id
    }
  }

  dynamic "properties" {
    for_each = each.value.properties != null ? each.value.properties : []
    content {
      compartment_id      = properties.value.compartment_id
      display_name        = properties.value.display_name
      fleet_property_type = properties.value.fleet_property_type
      is_required         = properties.value.is_required
      value               = properties.value.value
    }
  }

  dynamic "resources" {
    for_each = each.value.resources != null ? each.value.resources : []
    content {
      compartment_id      = resources.value.compartment_id
      fleet_resource_type = resources.value.fleet_resource_type
      resource_id         = resources.value.resource_id
      tenancy_id          = resources.value.tenancy_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

