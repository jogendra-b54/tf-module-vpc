resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_id        = aws_vpc.main.id
  peer_vpc_id   = "vpc-0c191255a724f193a"
//  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer_vpc_id
  auto_accept             = true

  tags = {
    Side = "Robot-${var.ENV}-default-vpc-peering"
  }
}