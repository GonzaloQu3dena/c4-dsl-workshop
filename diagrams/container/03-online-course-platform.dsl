workspace "online-course-platform" {

    model {
        student = person "Student" {
            tags "person"
            description "Take courses and assessments"
        }

        platform = softwareSystem "Online Course Platform" {
            description "Allows you to view courses and take assessments"

            web_app = container "Web Application" {
                description "Frontend that allows interaction with courses and assessments."
                tags "frontend"
            }

            db_courses = container "Courses Database" {
                description "Stores course information and assessments."
                tags "database"
            }

            api_backend = container "API Backend" {
                description "API que gestiona los cursos, evaluaciones"
                tags "backend"
            }

            student -> web_app "Access to courses and assessments"
            web_app -> api_backend "Request course data and results"
            api_backend -> db_courses "Read and write information about courses and assessments"
        }

        certifications = softwareSystem "External Certification System" {
            description "External certification system for courses."
            
            api_backend -> this "Validate certification requests"
        }
    }

    views {
        styles {
            element "person" {
                shape person
                background #84C1FF
                color #000000
            }

            element "frontend" {
                shape roundedbox
                background #F9DD8F
                color #000000
            }

            element "backend" {
                shape roundedbox
                background #8FCB9B
                color #000000
            }

            element "database" {
                shape cylinder
                background #cc3d3d
                color #000000
            }
        }
    }
}
