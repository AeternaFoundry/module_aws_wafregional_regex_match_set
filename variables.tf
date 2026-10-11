variable "wafregional_regex_match_sets" {
  description = <<EOT
Map of wafregional_regex_match_sets, attributes below
Required:
    - name
Optional:
    - region
    - regex_match_tuple (block):
        - field_to_match (required, block):
            - data (optional)
            - type (required)
        - regex_pattern_set_id (required)
        - text_transformation (required)
EOT

  type = map(object({
    name   = string
    region = optional(string)
    regex_match_tuple = optional(list(object({
      field_to_match = object({
        data = optional(string)
        type = string
      })
      regex_pattern_set_id = string
      text_transformation  = string
    })))
  }))
}

