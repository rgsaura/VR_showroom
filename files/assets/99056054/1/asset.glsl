uniform sampler2D texture_emissiveMap;

vec3 getEmission() {
    // Dot the world space normal with the world space directional light vector
    float nDotL = dot(dNormalW, light0_direction);
    // Clamp it between zero and one
    float factor = clamp(nDotL, 0.0, 1.0);
    // Scale the emissive map by the 'nighttime' factor
    return $texture2DSAMPLE(texture_emissiveMap, $UV).$CH * factor;
}