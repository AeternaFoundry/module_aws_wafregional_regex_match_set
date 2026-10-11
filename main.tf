resource "aws_wafregional_regex_match_set" "wafregional_regex_match_sets" {
  for_each = var.wafregional_regex_match_sets

  name   = each.value.name
  region = each.value.region

  dynamic "regex_match_tuple" {
    for_each = each.value.regex_match_tuple != null ? each.value.regex_match_tuple : []
    content {
      field_to_match {
        data = regex_match_tuple.value.field_to_match.data
        type = regex_match_tuple.value.field_to_match.type
      }
      regex_pattern_set_id = regex_match_tuple.value.regex_pattern_set_id
      text_transformation  = regex_match_tuple.value.text_transformation
    }
  }
}

