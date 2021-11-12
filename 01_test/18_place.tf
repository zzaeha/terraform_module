
resource "aws_placement_group" "zzaeha_place" {
  name = "zzaeha-place"
  strategy = "cluster"
}