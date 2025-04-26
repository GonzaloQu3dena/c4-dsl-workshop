workspace "medical-consultation-management-system" {
    
    model {
        patient = person "Patient" {
            tags "user"
            description "Schedule medical appointments, review your history, and communicate with your doctor."
        }
        
        doctors = person "Doctor" {
            tags "user"
            description "Treat the patient online."
        }
        
        platform = softwareSystem "Medical Consultation Management System" {
        
            app_web = container "Web Application" {
                tags "frontend"
                description "Frontend application that allows interaction with the user."
            }
            
            api_backend = container "API Backend" {
                tags "backend"
                description "API that manages the medical system."
                
                appointment_controller = component "AppointmentController" {
                    tags "component"
                    description "Receives HTTP requests from the frontend."
                }
                
                appointment_service = component "AppointmentService" {
                    tags "component"
                    description "Contains business logic to manage the system."
                }
                
                messaging_service = component "MessagingService" {
                    tags "component"
                    description "Handles communication between patients and doctors."
                }
                
                patient_repository = component "PatientRepository" {
                    tags "component"
                    description "Handles access to the patients database."
                }
                
                appointment_controller -> appointment_service "Delegates business logic"
                appointment_service -> patient_repository "Uses to access data"
                appointment_service -> messaging_service "Delegates messaging"
            }
            
            patients_database = container "Patients Database" {
                tags "database"
                description "Stores information from the medical consultation management system."
                
                patient_repository -> this "Reads/Writes data"
            }
            
            app_web -> api_backend "Request data and results of scheduled medical appointments and your medical history"
        }
        
        external_messaging_service = softwareSystem "External Messaging Service" {
            tags "external-service" 
            description "Handles patient-doctor communication."
            
            messaging_service -> external_messaging_service "Sends and receives messages"
        }
        
        patient -> app_web "Interacts with"
        doctors -> app_web "Uses for reviewing patient data and messaging"
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
            element "user" {
                shape person
            }
            
            element "frontend" {
                shape webbrowser
                background #F9DD8F
            }

            element "database" {
                shape cylinder
                background #FFB27F
            }
            
            element "component" {
                shape component
                background #A0CED9 
            }
            
            element "external-service" {
                shape roundedbox
                background #D8A7FF
            }

        }
    }
}