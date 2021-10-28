# FreeDoc

Création du backend d'une application de gestion de RDV médicaux dans le cadre de la formation The Hacking Project.

Application fonctionnelle en mode console :

* model Patient, Doctor, Appointment
* génération des seeds avec la gem Faker
* intégration de la gem table_print pour afficher les tables en mode console

```
bundle install
rails console
tp Doctor.all #pour afficher la table des docteurs
tp Patient.all #pour afficher la table des patients
tp Appointment.all #pour afficher la table des RDV
```

## Ajouts 2.0
* model City, Specialty
* Create join table
