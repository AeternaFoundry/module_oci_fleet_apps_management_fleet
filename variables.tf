variable "fleet_apps_management_fleets" {
  description = <<EOT
Map of fleet_apps_management_fleets, attributes below
Required:
    - compartment_id
    - display_name
    - resource_selection (block):
        - resource_selection_type (required)
        - rule_selection_criteria (optional, block):
            - match_condition (optional)
            - rules (optional, block):
                - basis (optional)
                - compartment_id (optional)
                - compartment_id_in_subtree (optional)
                - conditions (optional, block):
                    - attr_group (optional)
                    - attr_key (optional)
                    - attr_value (optional)
                - match_condition (optional)
                - resource_compartment_id (optional)
Optional:
    - defined_tags
    - description
    - environment_type
    - freeform_tags
    - is_target_auto_confirm
    - parent_fleet_id
    - products
    - credentials (block):
        - compartment_id (required)
        - display_name (required)
        - entity_specifics (required, block):
            - credential_level (required)
            - resource_id (optional)
            - target (optional)
            - variables (optional, block):
                - name (optional)
                - value (optional)
        - password (required, block):
            - credential_type (required)
            - key_id (optional)
            - key_version (optional)
            - secret_id (optional)
            - secret_version (optional)
            - value (optional)
            - vault_id (optional)
        - user (required, block):
            - credential_type (required)
            - key_id (optional)
            - key_version (optional)
            - secret_id (optional)
            - secret_version (optional)
            - value (optional)
            - vault_id (optional)
    - details (block):
        - fleet_type (optional)
    - notification_preferences (block):
        - compartment_id (required)
        - preferences (optional, block):
            - on_job_canceled (optional)
            - on_job_failure (optional)
            - on_job_schedule_change (optional)
            - on_job_start (optional)
            - on_job_success (optional)
            - on_resource_non_compliance (optional)
            - on_runbook_newer_version (optional)
            - on_task_failure (optional)
            - on_task_pause (optional)
            - on_task_success (optional)
            - on_topology_modification (optional)
            - upcoming_schedule (optional, block):
                - notify_before (optional)
                - on_upcoming_schedule (optional)
        - topic_id (required)
    - properties (block):
        - compartment_id (required)
        - display_name (optional)
        - fleet_property_type (required)
        - is_required (optional)
        - value (optional)
    - resources (block):
        - compartment_id (required)
        - fleet_resource_type (optional)
        - resource_id (required)
        - tenancy_id (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id         = string
    display_name           = string
    defined_tags           = optional(map(string))
    description            = optional(string)
    environment_type       = optional(string)
    freeform_tags          = optional(map(string))
    is_target_auto_confirm = optional(bool)
    parent_fleet_id        = optional(string)
    products               = optional(list(string))
    resource_selection = object({
      resource_selection_type = string
      rule_selection_criteria = optional(object({
        match_condition = optional(string)
        rules = optional(list(object({
          basis                     = optional(string)
          compartment_id            = optional(string)
          compartment_id_in_subtree = optional(bool)
          conditions = optional(list(object({
            attr_group = optional(string)
            attr_key   = optional(string)
            attr_value = optional(string)
          })))
          match_condition         = optional(string)
          resource_compartment_id = optional(string)
        })))
      }))
    })
    credentials = optional(list(object({
      compartment_id = string
      display_name   = string
      entity_specifics = object({
        credential_level = string
        resource_id      = optional(string)
        target           = optional(string)
        variables = optional(list(object({
          name  = optional(string)
          value = optional(string)
        })))
      })
      password = object({
        credential_type = string
        key_id          = optional(string)
        key_version     = optional(string)
        secret_id       = optional(string)
        secret_version  = optional(string)
        value           = optional(string)
        vault_id        = optional(string)
      })
      user = object({
        credential_type = string
        key_id          = optional(string)
        key_version     = optional(string)
        secret_id       = optional(string)
        secret_version  = optional(string)
        value           = optional(string)
        vault_id        = optional(string)
      })
    })))
    details = optional(object({
      fleet_type = optional(string)
    }))
    notification_preferences = optional(list(object({
      compartment_id = string
      preferences = optional(object({
        on_job_canceled            = optional(bool)
        on_job_failure             = optional(bool)
        on_job_schedule_change     = optional(bool)
        on_job_start               = optional(bool)
        on_job_success             = optional(bool)
        on_resource_non_compliance = optional(bool)
        on_runbook_newer_version   = optional(bool)
        on_task_failure            = optional(bool)
        on_task_pause              = optional(bool)
        on_task_success            = optional(bool)
        on_topology_modification   = optional(bool)
        upcoming_schedule = optional(object({
          notify_before        = optional(string)
          on_upcoming_schedule = optional(bool)
        }))
      }))
      topic_id = string
    })))
    properties = optional(list(object({
      compartment_id      = string
      display_name        = optional(string)
      fleet_property_type = string
      is_required         = optional(bool)
      value               = optional(string)
    })))
    resources = optional(list(object({
      compartment_id      = string
      fleet_resource_type = optional(string)
      resource_id         = string
      tenancy_id          = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.fleet_apps_management_fleets : (
        contains([for v in ["DYNAMIC", "MANUAL"] : lower(v)], lower(v.resource_selection.resource_selection_type))
      )
    ])
    error_message = "must be one of: \"DYNAMIC\", \"MANUAL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.fleet_apps_management_fleets : (
        v.credentials == null || alltrue([for item in v.credentials : (contains([for v in ["FLEET", "RESOURCE", "TARGET"] : lower(v)], lower(item.entity_specifics.credential_level)))])
      )
    ])
    error_message = "must be one of: \"FLEET\", \"RESOURCE\", \"TARGET\""
  }
  validation {
    condition = alltrue([
      for k, v in var.fleet_apps_management_fleets : (
        v.credentials == null || alltrue([for item in v.credentials : (contains([for v in ["KEY_ENCRYPTION", "PLAIN_TEXT", "VAULT_SECRET"] : lower(v)], lower(item.password.credential_type)))])
      )
    ])
    error_message = "must be one of: \"KEY_ENCRYPTION\", \"PLAIN_TEXT\", \"VAULT_SECRET\""
  }
  validation {
    condition = alltrue([
      for k, v in var.fleet_apps_management_fleets : (
        v.credentials == null || alltrue([for item in v.credentials : (contains([for v in ["KEY_ENCRYPTION", "PLAIN_TEXT", "VAULT_SECRET"] : lower(v)], lower(item.user.credential_type)))])
      )
    ])
    error_message = "must be one of: \"KEY_ENCRYPTION\", \"PLAIN_TEXT\", \"VAULT_SECRET\""
  }
}

