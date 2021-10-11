<?php

    use App\Core\Database;

    class OrderModel extends Database{

        //Get id-order of delivered orders by id-user
        function getDeliveredOrders($userId){
            $status = 4;
            $stmt = $this->conn->prepare("SELECT id FROM orders WHERE id_user=? AND id_status=?");

            $stmt->bind_param("ii", $userId, $status);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows >0){
                return $result->fetch_all(MYSQLI_ASSOC);
            }
            else return false;
        }

        //Get id-order of delivering orders by id-user
        function getDeliveringOrders($userId){
            $status = 3;
            $stmt = $this->conn->prepare("SELECT id FROM orders WHERE id_user=? AND id_status=?");

            $stmt->bind_param("ii", $userId, $status);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows >0){
                return $result->fetch_all(MYSQLI_ASSOC);
            }
            else return 0;
        }

        //Get id-order of prepairing orders by id-user
        function getPreparingOrders($userId){
            $status = 2;
            $stmt = $this->conn->prepare("SELECT id FROM orders WHERE id_user=? AND id_status=?");

            $stmt->bind_param("ii", $userId, $status);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows >0){
                return $result->fetch_all(MYSQLI_ASSOC);
            }
            else return false;
        }

        //Get id-order of no-processed orders by id-user
        function getNoProcessedOrders($userId){
            $status = 1;
            $stmt = $this->conn->prepare("SELECT id FROM orders WHERE id_user=? AND id_status=?");

            $stmt->bind_param("ii", $userId, $status);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows >0){
                return $result->fetch_all(MYSQLI_ASSOC);
            }
            else return false;
        }

        //Get cakes of every order
        function getVegeInOrder($orderId){
            $stmt = $this->conn->prepare("CALL sp_getVegeInOrder(?)");
            $stmt->bind_param("i", $orderId);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows >0){
                return $result->fetch_all(MYSQLI_ASSOC);
            }
            else return false;
        }
    }
?>