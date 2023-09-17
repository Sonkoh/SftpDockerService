# SftpDockerService
SftpDockerService es un servicio con el que puedes desplegar usuarios SFTP simplemente ejecutando un script, `./script/add_user.sh {username} {password} {storage}`

## Instrucciones
- Coloca el servicio en la ubicación `/root/service_sftp/`
- Inicia el docker-compose:
```docker-compose up -d --build```

## Scripts
- add_user.sh: El comando add_user.sh, te permite configurar un nuevo usuario, añadir los permisos necesarios y reiniciar el servicio.
```./scripts/add_user.sh <username> <password> <storage:GB>```
- del_user.sh: El comando del_user.sh, te permite eliminar permanentemente un usuario y sus datos.
```./scripts/del_user.sh <username>```
- disable_user.sh: El comando disable_user.sh, te permite deshabilitar un usuario temporalmente, sin eliminar sus datos.
```./scripts/disable_user.sh <username>```
- enable_user.sh: El comando enable_user.sh, te permite reactivar un usuario previamente deshabilitado.
```./scripts/enable_user.sh <username>```

## Detalles a tener en cuenta
- El servidor requiere un mínimo de un usuario,
- El archivo `./users.conf` debe tener una última linea vacia, de lo contrario, el servicio no leerá al último usuario
- Los scripts ya mencionados, fuerón hechos para ejecutarse de manera automática y pérfecta y no manual, por lo tanto, puede tener fallas al momento de ejecutar 2 veces el mismo comando con los mismos parametros, lo que puede provocar problemas como el duplicado de usuarios y carpetas.
