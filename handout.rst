Git Workshop
============

Aufbau eines Repositories
-------------------------

Auf oberster Ebene befindet sich der sog. Working Tree, ein Versionszustand
den man vorher ausgecheckt hat. Die eigentlichen Daten zur History usw.
befinden sich darin im Unterverzeichnis ".git"::

    /myproject/
        / ...
        / ...
        /.gitignore
        /.git/
            /objects/
            /refs/
            /logs/

Die Basis des Repositories ist ein Object Storage in dem Objekte anhand ihres
SHA1-Hashwertes referenziert werden. Objekte können Dateien, Verzeichnisse oder
Commits sein. Ein Commit enthält neben dem Text, Autor und Zeitstempel die
Hashwerte der aktuellen Dateien und die Hashwerte seiner Parent Commits. Damit
ist jede Version inkl. seiner kompletten History durch den Hashwert des Commits
eindeutig referenziert und Branches sind einfache Verweise auf einen Commit.

Eine detailliertere Beschreibung findet man im Git Book [#]_ in den Git
Internals [#]_.

Erste Schritte
--------------

Für brauchbare Commits sollten folgende Daten vorhanden sein::

    $ git config --global user.name "John Doe"
    $ git config --global user.email johndoe@seekda.com

Dann klont man das Repo und checkt den gewünschten Branch aus::

    $ git clone <url>
    $ cd <dir>
    $ git branch -a                     # List all branches
    $ git checkout -t origin/develop    # Check out and track branch

Workflow
--------

Es sollte grundsätzlich auf eigen Branches mit einem aussagekräftigen Namen
gearbeitet werden. Der bei Seekda empfohlene Workflow wird hier gut beschrieben
[#]_.

Man erstellt also einen neuen Branch und nimmt seine Änderungen vor::

    $ git checkout -b myfeature [develop|master]
    $ # hacking ...
    $ git diff
    $ git add [-p|-i] | git mv | git rm
    $ git diff --staged             # Show only changes staged for commit
    $ git commit
    $ git log

merged ihn anschließend wieder::

    $ git checkout develop
    $ git fetch
    $ git status
    $ git pull --ff-only            # Don't merge upstream
    $ git merge --no-ff myfeature   # Always merge explicitly

und pusht die Veränderungen::

    $ git push origin develop
    $ git branch -d myfeature

Man kann auch upstream in einen neuen Branch pushen::

    $ git push -u origin <refspec>

Fast-Forward vs. Non-Fast-Forward
---------------------------------

Wenn ein jüngerer Branch auf einen älteren basiert und dieser hineingemerged
wird, dann können alle neuen Commits unverändert kopiert werden und der HEAD
des alten Branches auf den neuen HEAD gesetzt werden. Man spricht von einem
Fast-Forward.

Wenn ein Feature Branch gemerged wird, dann möchte man diese Information
erhalten. Ein Fast-Forward ist unerwünscht.

Möchte man die Upstream-Commits holen, dann möchte man nicht mergen. Ein
Fast-Forward ist erwünscht.

Ein pushen von Commits ist normalerweise nur im Fast-Forward möglich.

Weiterführendes
---------------

History Rewrite::

    $ git commit --amend
    $ git rebase -i <new-base>
    $ git reset [--hard] <commit>
    $ git reflog

Commits holen oder Änderungen Rückgängig machen::

    $ git checkout -- <file>
    $ git revert <commit>
    $ git cherry-pick <commit>

Aktuelle Änderungen zwischenspeichern::

    $ git stash
    $ git stash pop

Man kann jederzeit über::

    $ git help

Hilfe holen. Empfohlene Hilfeseiten::

    $ git help revisions
    $ git help rebase


.. [#] http://git-scm.com/book
.. [#] http://git-scm.com/book/en/Git-Internals
.. [#] http://nvie.com/posts/a-successful-git-branching-model/

