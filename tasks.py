from invoke import Context, task

@task
def build(c: Context):
    c.run("jupyter-book clean book")
    c.run("jupyter-book build book")
