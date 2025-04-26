workspace "reservations-backend" {
    
    model {
        sms_service = softwareSystem "External SMS Service" {
            tags "external-service"
            description "External system that sends SMS notifications."
        }
    
        platform = softwareSystem "Reservation System" {
            description "Allows you to make reservations."
            
            api_backend = container "API Backend" {
                description "API that manages the reservation platform."
                
                reservation_controller = component "ReservationController" {
                    tags "controller"
                    description "Receives HTTP requests from the frontend."
                }
                
                reservation_service = component "ReservationService" {
                    tags "service"
                    description "Contains business logic to manage reservations."
                }
                
                notification_service = component "NotificationService" {
                    tags "service"
                    description "It is responsible for invoking the SMS service."
                }
                
                reservation_repository = component "ReservationRepository" {
                    tags "repository"
                    description "Handles access to the reservations database."
                }
                
                reservation_controller -> reservation_service "Delegates business logic"
                reservation_service -> reservation_repository "Uses to access data"
                notification_service -> sms_service "Send reservation confirmations via SMS"
            }
            
            reservations_db = container "Reservations Database" {
                tags "database"
                description "Stores reservation data."
                
                reservation_repository -> this "Reads/Writes reservation data"
            }
        }
    }
    
    views {
        styles {
            element "controller" {
                shape component
                background #FFD6E0
            }
    
            element "service" {
                shape component
                background #A0CED9
            }
    
            element "repository" {
                shape component
                background #B3E283
            }
    
            element "database" {
                shape cylinder
                background #FFDAC1
            }
    
            element "external-service" {
                shape roundedbox
                background #D8A7FF
            }
        }
    }

}