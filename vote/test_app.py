import app as vote_app


def test_home_page_renders_the_two_options():
    client = vote_app.app.test_client()
    resp = client.get("/")
    assert resp.status_code == 200
    body = resp.data
    assert b"Cats" in body
    assert b"Dogs" in body


def test_home_page_sets_a_voter_cookie():
    client = vote_app.app.test_client()
    resp = client.get("/")
    assert "voter_id" in resp.headers.get("Set-Cookie", "")
