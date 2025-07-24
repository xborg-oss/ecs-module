resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags  = merge(var.tags, { Name = "${var.name}-igw" })
}

resource "aws_eip" "nat" {
  count = length(var.azs)
  tags  = merge(var.tags, { Name = "${var.name}-nat-eip-${count.index}" })
}

resource "aws_nat_gateway" "this" {
  count         = length(var.azs)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags          = merge(var.tags, { Name = "${var.name}-natgw-${count.index}" })
  depends_on    = [aws_internet_gateway.this]
} 