# Sauvegardes différentielles du lundi au samedi à 2h du matin
0 2 * * 1-6 /chemin/vers/script_sauvegarde_diff.sh

# Sauvegarde complète hebdomadaire le dimanche à 3h du matin
0 3 * * 0 /chemin/vers/script_sauvegarde_full.sh

# Sauvegarde complète mensuelle le premier jour de chaque mois à 4h du matin
0 4 1 * * /chemin/vers/script_sauvegarde_full.sh

# Nettoyage des anciennes sauvegardes tous les jours à 5h du matin
0 5 * * * /chemin/vers/script_nettoyage_backup.sh