resource "aws_eip" "nat" {
  vpc = true

  tags = {
    name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public-eu-north-1a.id

  tags = {
    name = "nat"
  }

  depends_on = [ aws_internet_gateway.igw ]
}