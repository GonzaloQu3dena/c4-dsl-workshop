workspace "complaints-and-support-system" {
    
    model {
        customer = person "Customer" {
            description "Register complaints"
        }
        
        external_ticket_service = softwareSystem "External Ticket Service" {
            description "Manage a ticket system."
        }
        
        platform = softwareSystem "Complaints and Support System" {
        
            app_web = container "Web Application" {
                tags "web"
                description "Web app for registering complaints and tracking support."
            }
            
            app_mobile = container "Mobile Application" {
                tags "mobile"
                description "Mobile app to file complaints and receive updates."
            }
            
            api_backend = container "Backend Support" {
                tags "backend"
                description "API that manages the complaints and support system."
                
                claim_controller = component "ClaimController" {
                    tags "component"
                    description "Receives HTTP requests from the frontend."
                }
                
                claim_service = component "ClaimService" {
                    tags "component"
                    description "Contains business logic to manage the system."
                }
                
                ticketing_gateway = component "TicketingGateway" {
                    tags "component"
                    description "Gateway para exponer y enrutar operaciones de ticketing."
                }
                
                claim_repository = component "ClaimRepository" {
                    tags "component"
                    description "Handles access to the complaints database."
                }
                
                claim_controller -> claim_service "Delegates business logic"
                claim_service -> claim_repository "Uses to access data"
                claim_service -> ticketing_gateway "Creates/updates tickets"
                
                ticketing_gateway -> external_ticket_service "Sends ticket operations"
            }   
            
            complaints_db = container "Complaints Database" {
                tags "database"
                description "Stores information from the complaints and support system."
                claim_repository -> this "Reads/Writes data"
            }
        }
        
        customer -> app_web "Interacts with"
        customer -> app_mobile "Interacts with"
        
        app_web -> api_backend "Request data and results of complaints and support"
        app_mobile -> api_backend "Request data and results of complaints and support"
    }
    
    views {
    
        systemContext platform {
            include *
            autolayout lr
        }

        container platform {
            include *
            autolayout lr
        }
        
        component api_backend {
            include *
            autolayout lr
        }
        
        styles {
            element "web" {
                shape webBrowser
                background #FCD37F
            }
            
            element "mobile" {
                shape mobileDevicePortrait
                background #FCD37F
            }
        
            element "Person" {
                shape person
                background #84C1FF
            }
            
            element "component" {
                shape component
                background #A0CED9
            }
            
            element "database" {
                shape cylinder
                background #F6C5C5
            }
            
            element "backend" {
                shape hexagon
                background #A0D995
            }
        }
    }
}