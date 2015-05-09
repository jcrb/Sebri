# sebri.R

# Transforme un vecteur de facteurs en table à 2 lignes:
# - nombre de cas
# - proportion
# L'intitulé de colonnes est par défaut celui les levels du vecteur
factor2table <- function(x, col = NULL, digit = 2){
    x <- as.factor(x)
    s.x <- summary(x)
    p.x <- round(prop.table(s.x) * 100, digit)
    t.x <- rbind(s.x, p.x)
    rownames(t.x) <- c("nombre", "proportion")
    if(is.null(col))
        colnames(t.x) <- colnames(t.x) #levels(x)
    else
        colnames(t.x) <- col
    return(t.x)
}

# création d'une colonne outils de communication

outil.com <- function(){
    d1$COM <- ""
    if(is.na(d1$Q3.1tpc) & is.na(d1$Q3.2sp))
        d1$COM <- NA
    else if(d1$Q3.1tpc == "non" & d1$Q3.2sp == "non")
        d1$COM <- "non"
    else
        d1$COM <- "oui"
}
