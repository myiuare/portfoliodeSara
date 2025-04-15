<?php
// Vérifier si tous les champs sont remplis
if(empty($_POST['name'])      ||
   empty($_POST['email'])     ||
   empty($_POST['phone'])     ||
   empty($_POST['message'])   ||
   !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
   echo "Tous les champs sont requis ou l'email n'est pas valide!";
   return false;
}

// Nettoyer les données d'entrée pour éviter les attaques XSS et Injection
$name = strip_tags(htmlspecialchars($_POST['name']));
$email_address = strip_tags(htmlspecialchars($_POST['email']));
$phone = strip_tags(htmlspecialchars($_POST['phone']));
$message = strip_tags(htmlspecialchars($_POST['message']));

// Créer l'email et envoyer le message
$to = 'slealsemedo@gmail.com'; // Remplace par ton adresse email
$email_subject = "Formulaire de Contact Website :  $name";
$email_body = "Vous avez reçu un nouveau message depuis le formulaire de contact de votre site.\n\n"."Voici les détails:\n\nNom: $name\n\nEmail: $email_address\n\nTéléphone: $phone\n\nMessage:\n$message";
$headers = "From: noreply@votredomaine.com\n"; // Adresse email d'expéditeur (utilise une adresse valide pour éviter que l'email n'atterrisse dans les spams)
$headers .= "Reply-To: $email_address";   

// Envoyer l'email
if(mail($to, $email_subject, $email_body, $headers)) {
    echo "Message envoyé avec succès!";
} else {
    echo "Une erreur est survenue, l'email n'a pas pu être envoyé.";
}

return true;
?>

<?php
if(mail('test@example.com', 'Test Subject', 'Test message')) {
    echo 'Email sent successfully.';
} else {
    echo 'Email sending failed.';
}
?>
