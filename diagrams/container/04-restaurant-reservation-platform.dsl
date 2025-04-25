workspace "restaurant-reservation-platform" {

    model {
        
        user = person "Customer" {
            tags "customer"
            description "Reserve tables for restaurants."
        }
        
        platform = softwareSystem "Reservation Platform" {
            description "Allows you to reserve tables for a restaurant."
            
            app_mobile = container "Mobile Application" {
                tags "mobile"
                description "Interaction with the customer to make reservations."
            }
            
            api_backend = container "API Backend" {
                tags "backend"
                description "API that manages reservations made by customers."
            }
            
            api_public = container "Public API" {
                tags "public-api"
                description "Public API for restaurants to integrate their own apps."
            }
            
            db_reservations = container "Reservation Database" {
                tags "database"
                description "Store reservation information."
            }
            
            user -> app_mobile "Make a reservation"
            app_mobile -> api_backend "Request reservation information."
            api_backend -> db_reservations "Read and write information about reservations."
            api_public -> api_backend "Delegate requests."
        }
        
        sms_service = softwareSystem "SMS Service" {
            tags "sms"
            description "External system that sends SMS notifications to customers."
            
            api_backend -> this "Send reservation confirmations via SMS"
        }
    }
    
    views {
    
        container platform {
            include *
            autolayout lr
        }
        
        styles {
            element "customer" {
                shape Person
                background #84C1FF
            }
    
            element "mobile" {
                shape MobileDevicePortrait
                background #FCD37F
            }
    
            element "backend" {
                shape Hexagon
                background #8FCB9B
            }
    
            element "public-api" {
                shape Hexagon
                background #B5EAD7
            }
    
            element "database" {
                shape Cylinder
                background #FFDAC1
            }
    
            element "sms" {
                shape RoundedBox
            }
        }
    }
}