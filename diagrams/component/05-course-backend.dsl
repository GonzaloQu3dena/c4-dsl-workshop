workspace "course-platform-backend" {
    
    model {
        platform = softwareSystem "Online Course Platform" {
            description "Allows you to view courses and take assessments."
            
            api_backend = container "API Backend" {
                description "API that manages the platform's courses."
                
                course_controller = component "CourseController" {
                    tags "controller"
                    description "Receives HTTP requests from the frontend."
                }
                
                course_service = component "CourseService" {
                    tags "service"
                    description "Contains business logic to list and manage courses."
                }
                
                course_repository = component "CourseRepository" {
                    tags "repository"
                    description "Handles access to the courses database."
                }
                
                course_controller -> course_service "Delegates business logic"
                course_service -> course_repository "Uses to access data"
            }
        }
    }
    
    views {
        component api_backend {
            include *
            autolayout lr
        }

        styles {
            element "controller" {
                shape Component
                background #FAD6A5
                color #000000
            }

            element "service" {
                shape Component
                background #FF9AA2
                color #000000
            }

            element "repository" {
                shape Component
                background #B5EAD7
                color #000000
            }
        }
    }
}