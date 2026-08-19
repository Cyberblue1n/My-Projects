import streamlit as st
import joblib
import numpy as np

# Load model
model = joblib.load('xgb_model.pkl')

st.title("🎵 Spotify Song Popularity Predictor")
st.write("Adjust the audio features below to predict a song's popularity score!")

st.sidebar.header("🎛️ Audio Features")

# Input sliders — order matches X_train exactly:

duration_ms      = st.sidebar.slider("Duration (ms)",    60000, 600000, 210000)
explicit         = st.sidebar.selectbox("Explicit?",     [0, 1])
danceability     = st.sidebar.slider("Danceability",     0.0, 1.0, 0.5)
energy           = st.sidebar.slider("Energy",           0.0, 1.0, 0.5)
key              = st.sidebar.slider("Key",              0, 11, 5)
loudness         = st.sidebar.slider("Loudness (dB)",   -60.0, 0.0, -10.0)
mode             = st.sidebar.selectbox("Mode",          [0, 1])
speechiness      = st.sidebar.slider("Speechiness",      0.0, 1.0, 0.05)
acousticness     = st.sidebar.slider("Acousticness",     0.0, 1.0, 0.5)
instrumentalness = st.sidebar.slider("Instrumentalness", 0.0, 1.0, 0.0)
liveness         = st.sidebar.slider("Liveness",         0.0, 1.0, 0.1)
valence          = st.sidebar.slider("Valence",          0.0, 1.0, 0.5)
tempo            = st.sidebar.slider("Tempo (BPM)",      50.0, 220.0, 120.0)
time_signature   = st.sidebar.slider("Time Signature",   1, 5, 4)
track_genre      = st.sidebar.slider("Genre Code",       0, 113, 0)

# Predict button
if st.button("🎯 Predict Popularity"):
    # Order must exactly match X_train.columns
    features = np.array([[duration_ms, explicit, danceability, energy, key,
                          loudness, mode, speechiness, acousticness,
                          instrumentalness, liveness, valence, tempo,
                          time_signature, track_genre]])

    prediction = model.predict(features)[0]
    score = round(float(prediction), 1)
    score = max(0, min(100, score))  # clamp between 0-100

    st.subheader(f"Predicted Popularity Score: {score} / 100")

    # Visual feedback
    if score >= 70:
        st.success("🔥 This could be a HIT!")
    elif score >= 45:
        st.info("🎵 Decent popularity expected")
    else:
        st.warning("📉 Might not chart well")

    st.progress(int(score))