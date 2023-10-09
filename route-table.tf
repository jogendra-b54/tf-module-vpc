# Creates public Route table

resource "aws_route_table" "public_rt" {
  vpc_id         =  aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
        Name = "roboshop-${var.ENV}-public-rt"
  }
}

# Associates the route-table to the public-subnet

resource "aws_route_table_association" "public_subnet_rt_association" {
  count           = length(aws_subnet.public_subnet.*.id)  // * includes everythin subnets ids of all the subnets created by aws subnet.public subnet
 
  subnet_id       = element(aws_subnet.public_subnet.*.id , count.index)
  route_table_id  = aws_route_table.public_rt.id
 }



 # Creates Private Route table
resource "aws_route_table" "private_rt" {
  vpc_id         =  aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
        Name = "roboshop-${var.ENV}-private-rt"
  }
}

# Associates the route-table to the private-subnet

resource "aws_route_table_association" "private_subnet_rt_association" {
  count           = length(aws_subnet.private_subnet.*.id)  // * includes everythin subnets ids of all the subnets created by aws subnet.public subnet
 
  subnet_id       = element(aws_subnet.private_subnet.*.id , count.index)
  route_table_id  = aws_route_table.private_rt.id
 }
