resource "aws_vpc" "demo" {
  cidr_block = "10.0.0.0/24"
  tags = {
    "Name" = "demo"
  }
}
data "aws_availability_zones" "zones" {
  state = "available"


}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.0.0.0/26"
  availability_zone = data.aws_availability_zones.zones.names[0]
  tags = {
    "zone" = "1"
  }

}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.0.0.64/26"
  availability_zone = data.aws_availability_zones.zones.names[1]
  tags = {
    "zone" = "2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.0.0.128/26"
  availability_zone = data.aws_availability_zones.zones.names[0]
  tags = {
    "zone" = "1"
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.0.0.192/26"
  availability_zone = data.aws_availability_zones.zones.names[1]
  tags = {
    "zone" = "2"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo.id
  tags = {
    "Name" = "demo"
  }

}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.demo.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_route_table_association" "subnet1_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "subnet2_association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}
