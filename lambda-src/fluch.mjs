export async function lambda_handler() {
  const API_KEY = process.env.GOOGLE_API_KEY;
  const PROMPT = process.env.FLUCH_PROMPT;

  const res = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash-lite:generateContent?key=${API_KEY}`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        contents: [
          {
            parts: [
              {
                text: PROMPT,
              },
            ],
          },
        ],
        generationConfig: {
          temperature: 1.2, // mehr Zufall!
          topK: 40,
          topP: 0.9,
          candidateCount: 1,
        },
      }),
    }
  );
  const json = await res.json();
  console.log("Gemini response:", JSON.stringify(json, null, 2));
  const text =
    json.candidates[0].content.parts[0].text ||
    "Ein dunkles Schicksal erwartet dich...";
  return {
    statusCode: 200,
    headers: { "Access-Control-Allow-Origin": "*" },
    body: JSON.stringify({ text }),
  };
}
