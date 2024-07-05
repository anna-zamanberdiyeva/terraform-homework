# Create users

resource "aws_iam_user" "users" {
  for_each = toset(["jenny2","rose2","lisa2","jisoo2"])
  name = each.key
}

# Create groups

resource "aws_iam_group" "blackpink2" {
  name = "blackpink2"
}

# Add users to group 

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    for i in aws_iam_user.users : i.name
  ]

  group = aws_iam_group.blackpink2.name
}