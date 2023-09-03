# Build the project first with a node container
FROM rockylinux:9.2

# Below install items and those requiring EPEL
RUN dnf install -y \
    openldap-clients \
    sssd-ldap \
    authselect \
    epel-release \
    && dnf install -y \
    slurm-slurmctld \
    supervisor \
    && dnf clean all

RUN authselect select sssd --force

COPY container /

CMD [ "supervisord" ]
